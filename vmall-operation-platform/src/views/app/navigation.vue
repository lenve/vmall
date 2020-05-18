<template>
  <div class="app_categories_container">
    <div style="display: flex;justify-content: space-between;width: 50%">
      <div>Tab名称：
        <el-input v-model="name" style="width: 200px" />
      </div>
      <div>Tab状态：
        <el-select v-model="state" placeholder="全部">
          <el-option
            v-for="item in stateArr"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
      </div>
      <el-button type="primary" @click="loadCategories">查询</el-button>
      <el-button type="primary" @click="showAddAppTabsView">添加</el-button>
    </div>
    <div style="margin-top: 30px">
      <el-table
        :data="apptabs"
        stripe
        border
        style="width: 100%"
      >
        <el-table-column
          prop="id"
          label="编号"
          width="80"
        />
        <el-table-column
          prop="name"
          label="Tab名称"
          width="120"
        />
        <el-table-column
          label="Tab图标"
        >
          <template slot-scope="scope">
            <img :src="scope.row.inactiveIcon" style="width: 48px;height: 48px" alt="">
          </template>
        </el-table-column>
        <el-table-column
          label="Tab活跃图标"
        >
          <template slot-scope="scope">
            <img :src="scope.row.activeIcon" style="width: 48px;height: 48px" alt="">
          </template>
        </el-table-column>
        <el-table-column
          label="状态"
          width="100"
        >
          <template slot-scope="scope">
            <el-tag v-if="scope.row.state==0">待审核</el-tag>
            <el-tag v-else-if="scope.row.state==1" type="success">已上架</el-tag>
            <el-tag v-else-if="scope.row.state==2" type="info">已下架</el-tag>
            <el-tag v-else-if="scope.row.state==3" type="warning">待开始</el-tag>
            <el-tag v-else-if="scope.row.state==4" type="danger">使用中</el-tag>
            <el-tag v-else-if="scope.row.state==5">已结束</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          label="启用时效"
          width="100"
        >
          <template slot-scope="scope">
            <el-tag v-if="scope.row.type==0" type="success">立即生效</el-tag>
            <el-tag v-else-if="scope.row.type==1" type="info">定时活动</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          prop="weight"
          label="权重"
          width="60"
        />
        <el-table-column
          prop="startTime"
          label="开始时间"
        />
        <el-table-column
          prop="endTime"
          label="结束时间"
        />
        <el-table-column
          prop="description"
          label="说明"
          width="100"
        />
        <el-table-column
          prop="lastUpdate"
          label="最后修改人"
          width="100"
        />
        <el-table-column
          prop="lastUpdateTime"
          label="最后修改时间"
        />
        <el-table-column label="操作" width="150">
          <el-button type="danger">下架</el-button>
          <el-button>编辑</el-button>
        </el-table-column>
      </el-table>
      <div style="display: flex;justify-content: flex-end;align-items: center">
        <el-pagination
          layout="sizes, prev, pager, next, jumper, ->, total, slot"
          :total="total"
          :page-sizes="[5,10,15,20]"
          @current-change="currentChange"
          @size-change="sizeChange"
        />
      </div>
    </div>
    <el-dialog
      title="添加Tab"
      :visible.sync="dialogVisible"
      class="addAppCategoriesDialog"
      width="40%"
    >
      <div>
        <table>
          <tr>
            <td>
              <el-tag>Tab名称：</el-tag>
            </td>
            <td>
              <el-input v-model="apptab.name" />
            </td>
            <td>
              <el-tag>Tab说明：</el-tag>
            </td>
            <td>
              <el-input v-model="apptab.description" />
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>未激活图标：</el-tag>
            </td>
            <td>
              <el-upload
                ref="upload"
                class="upload-container"
                :multiple="false"
                :limit="1"
                :headers="myHeaders"
                :on-success="inActiveSuccess"
                :on-error="inActiveError"
                :file-list="fileList"
                action="/file/upload"
              >
                <el-button size="mini" type="primary">选择未激活图标</el-button>
              </el-upload>
            </td>
            <td>
              <el-tag>激活图标：</el-tag>
            </td>
            <td>
              <el-upload
                ref="upload"
                class="upload-container"
                :multiple="false"
                :limit="1"
                :headers="myHeaders"
                :on-success="activeSuccess"
                :on-error="activeError"
                :file-list="fileList"
                action="/file/upload"
              >
                <el-button size="mini" type="primary">选择激活图标</el-button>
              </el-upload>
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>状态：</el-tag>
            </td>
            <td>
              <el-select v-model="apptab.state" placeholder="全部">
                <el-option
                  v-for="item in stateArr"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </td>
            <td>
              <el-tag>权重：</el-tag>
            </td>
            <td>
              <el-input-number v-model="apptab.weight" :min="1" :max="10" />
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>启用时效：</el-tag>
            </td>
            <td>
              <el-select v-model="apptab.type" placeholder="全部">
                <el-option
                  v-for="item in types"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </td>
          </tr>
          <tr v-if="apptab.type==1">
            <td>
              <el-tag>开始时间：</el-tag>
            </td>
            <td>
              <el-date-picker
                v-model="apptab.startTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="选择日期时间"
              />
            </td>
            <td>
              <el-tag>结束时间：</el-tag>
            </td>
            <td>
              <el-date-picker
                v-model="apptab.endTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="选择日期时间"
              />
            </td>
          </tr>
        </table>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="doAddAppTabs">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { getToken } from '@/utils/auth'

export default {
  name: 'Navigation',
  data() {
    return {
      total: 10,
      myHeaders: { Authorization: 'Bearer ' + getToken() },
      fileList: [],
      apptab: {
        name: '',
        activeIcon: '',
        inactiveIcon: '',
        state: 0,
        weight: '',
        type: 0,
        startTime: '',
        endTime: '',
        description: ''
      },
      dialogVisible: false,
      apptabs: [],
      types: [
        {
          value: 0,
          label: '立即生效'
        }, {
          value: 1,
          label: '定时活动'
        }
      ],
      stateArr: [{
        value: 0,
        label: '待审核'
      }, {
        value: 1,
        label: '已上架'
      }, {
        value: 2,
        label: '已下架'
      }, {
        value: 3,
        label: '待开始'
      }, {
        value: 4,
        label: '使用中'
      }, {
        value: 5,
        label: '已结束'
      }],
      state: null,
      name: null,
      size: 10,
      page: 1
    }
  },
  mounted() {
    this.initAppTabs()
  },
  methods: {
    currentChange(page) {
      this.page = page
    },
    sizeChange(size) {
      this.size = size
    },
    showAddAppTabsView() {
      this.dialogVisible = true
    },
    doAddAppTabs() {
      this.$store.dispatch('appmanager/addAppTabs', this.apptab).then(resp => {
        this.dialogVisible = false
        this.initAppTabs()
      })
    },
    inActiveSuccess(response, file, fileList) {
      this.apptab.inactiveIcon = response.data
    },
    inActiveError(err, file, fileList) {
      console.log(err)
    },
    activeSuccess(response, file, fileList) {
      this.apptab.activeIcon = response.data
    },
    activeError(err, file, fileList) {
      console.log(err)
    },
    loadCategories() {
      this.initAppTabs()
    },
    initAppTabs() {
      this.$store.dispatch('appmanager/getAppTabs', null).then((resp) => {
        this.apptabs = resp.data
        this.total = resp.total
      })
    }
  }
}
</script>

<style scoped>

</style>
<style>
  .upload-container {
    display: flex;
    align-items: center;
  }
</style>
