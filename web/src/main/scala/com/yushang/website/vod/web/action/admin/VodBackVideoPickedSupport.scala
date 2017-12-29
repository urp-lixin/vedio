package com.yushang.website.vod.web.action.admin
import scala.collection.mutable.{ Buffer, ListBuffer }
import scala.util.control.Breaks.{ break, breakable }

import org.beangle.commons.collection.Collections
import org.beangle.commons.lang.reflect.Reflections
import org.beangle.data.dao.{ Condition, OqlBuilder }

import com.yushang.website.vod.core.VideoPicked
import com.yushang.website.vod.core.model.Nav

class VodBackVideoPickedSupport[T <: VideoPicked] extends VodBackSupport[T] {

  override protected def indexSetting(): Unit = {
    super.indexSetting
    put("navs", entityDao.getAll(classOf[Nav]))
  }

  private val entityClazz: Class[T] = {
    val tClass = Reflections.getGenericParamType(getClass, classOf[VodBackVideoPickedSupport[_]]).get("T")
    if (tClass.isEmpty) throw new RuntimeException(s"Cannot guess entity type from ${this.getClass.getName}")
    else tClass.get.asInstanceOf[Class[T]]
  }

  /**
   * 将最新配置的视频记录按“最上方的（即第一条）先排，后面的在前面的基础上”进行编序
   *
   * @param entities
   */
  protected final def sortNewest(entities: Buffer[T]): Unit = {
    // 暂存新增的顺序
    var w1 = new ListBuffer[Temp]
    for (i <- 0 until entities.size) {
      w1 += new Temp(i, entities(i))
    }

    val n = w1.size

    w1 = w1.sortWith(_.entity.indexNo >= _.entity.indexNo)
    var i = n - 1
    breakable {
      var indexNoG, indexNoC = w1(i).entity.indexNo
      i -= 1
      while (i >= 0) {
        var j = i - 1
        if (j > 0 && w1(j).entity.indexNo == indexNoG) {
          while (j > 0 && w1(j).entity.indexNo == indexNoG) {
            indexNoC += 1
            w1(j).entity.indexNo = indexNoC
            j -= 1
          }
          i = j
          indexNoG = indexNoC
        } else {
          if (w1(i).entity.indexNo <= indexNoG) {
            indexNoG += 1
            w1(i).entity.indexNo = indexNoG
          } else {
            indexNoG = w1(i).entity.indexNo
          }
          i -= 1
        }
      }
    }

    w1 = w1.sortWith(_.entity.indexNo < _.entity.indexNo)

    for (k <- 0 until w1.size) {
      entities(k) = w1(k).entity
    }
  }

  /**
   * 将编好序的新纪录与已经存在的记录比对和编序
   *
   * @param entities
   * @return
   */
  protected final def sortOldest(newests: Buffer[T], isByAllSameNav: Boolean = false): Buffer[T] = {
    val entities = Collections.newBuffer[T]

    val builder = OqlBuilder.from(entityClazz, "entity")
    var whereExp = ""
    val args = Collections.newBuffer[Int]
    for (newest <- newests; i <- 0 until newests.size) {
      if (whereExp.length > 0) {
        whereExp += " or "
      }

      whereExp += "entity.indexNo >= :indexNo" + i
      args += newest.indexNo
    }
    val condition = new Condition(whereExp)
    condition.params ++= args
    builder.where(condition)
    if (isByAllSameNav) {
      builder.where("entity.video.nav = :nav", newests(0).video.nav)
    }
    builder.orderBy("entity.indexNo")
    entities ++= entityDao.search(builder)

    while (!newests.isEmpty) {
      val newest = newests(0)
      breakable {
        var isInserted = false
        for (p <- 0 until entities.size) {
          val entity = entities(p)
          if (entity.indexNo >= newest.indexNo) {
            isInserted = true
            if (entity.indexNo == newest.indexNo) {
              var q = p
              var indexNo = entity.indexNo
              do {
                entities(q).indexNo += 1
                indexNo = entities(q).indexNo
                q += 1
              } while (q < entities.size && entities(q).indexNo == indexNo)
            }
            entities.insert(p, newest)
            break
          }
          if (isInserted) {
            break
          }
        }
        if (!isInserted) {
          entities += newest
        }
      }

      newests.remove(0)
    }
    entities
  }

  private class Temp(i: Int, e: T) {

    var index = i

    var entity = e
  }
}