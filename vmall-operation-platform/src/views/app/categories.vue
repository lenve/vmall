<template>
  <div class="app_categories_container">
    <div style="display: flex;justify-content: space-between;width: 70%">
      <div>类目名称：
        <el-input v-model="name" style="width: 200px" />
      </div>
      <div>类目状态：
        <el-select v-model="state" placeholder="全部">
          <el-option
            v-for="item in stateArr"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
      </div>
      <div>跳转类型：
        <el-select v-model="type" placeholder="全部">
          <el-option
            v-for="item in typeArr"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
      </div>
      <el-button type="primary" @click="loadCategories">查询</el-button>
      <el-button type="primary" @click="showAddAppCategoriesView">添加</el-button>
    </div>
    <div style="margin-top: 30px">
      <el-table
        :data="categories"
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
          label="类目名称"
          width="120"
        />
        <el-table-column
          label="类目icon"
        >
          <template slot-scope="scope">
            <img :src="scope.row.icon" style="width: 48px;height: 48px" alt="">
          </template>
        </el-table-column>
        <el-table-column
          label="跳转类型"
          width="80"
        >
          <template slot-scope="scope">
            <el-tag v-if="scope.row.type==0">H5</el-tag>
            <el-tag v-else type="success">分类</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          prop="url"
          label="跳转地址"
          width="150"
        />
        <el-table-column
          prop="state"
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
      title="添加类目"
      :visible.sync="dialogVisible"
      class="addAppCategoriesDialog"
      width="50%"
    >
      <div>
        <table>
          <tr>
            <td>
              <el-tag>类目名称：</el-tag>
            </td>
            <td>
              <el-input v-model="category.name" />
            </td>
            <td>
              <el-tag>类目图标：</el-tag>
            </td>
            <td>
              <el-upload
                ref="upload"
                class="upload-container"
                :data="category"
                :multiple="false"
                :limit="1"
                :headers="myHeaders"
                :auto-upload="false"
                :on-success="onSuccess"
                :on-error="onError"
                :file-list="fileList"
                action="/appmanager/app/categories/"
              >
                <el-button size="mini" type="primary">选择图标</el-button>
              </el-upload>
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>跳转类型：</el-tag>
            </td>
            <td>
              <el-select v-model="category.type" placeholder="全部">
                <el-option
                  v-for="item in typeArr"
                  :key="item.value"
                  :label="item.label"
                  :value="item.value"
                />
              </el-select>
            </td>
            <td>
              <el-tag>跳转地址：</el-tag>
            </td>
            <td>
              <el-input v-model="category.url" :disabled="category.type!=0" />
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>状态：</el-tag>
            </td>
            <td>
              <el-select v-model="category.state" placeholder="全部">
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
              <el-input-number v-model="category.weight" :min="1" :max="10" />
            </td>
          </tr>
          <tr>
            <td>
              <el-tag>开始时间：</el-tag>
            </td>
            <td>
              <el-date-picker
                v-model="category.startTime"
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
                v-model="category.endTime"
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
        <el-button type="primary" @click="doAddCategories">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { getToken } from '@/utils/auth'

export default {
  name: 'Categories',
  data() {
    return {
      total: 10,
      myHeaders: { Authorization: 'Bearer ' + getToken() },
      fileList: [],
      category: {
        name: '',
        icon: '',
        type: 0,
        url: '',
        state: 0,
        weight: '',
        startTime: '',
        endTime: '',
        lastUp: '',
        lastUpTime: ''
      },
      dialogVisible: false,
      categories: [],
      typeArr: [
        {
          value: 0,
          label: 'H5'
        }, {
          value: 1,
          label: '分类'
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
      type: null,
      size: 10,
      page: 1
    }
  },
  mounted() {
    this.initCategories()
  },
  methods: {
    currentChange(page) {
      this.page = page
    },
    sizeChange(size) {
      this.size = size
    },
    showAddAppCategoriesView() {
      this.dialogVisible = true
    },
    doAddCategories() {
      this.$refs.upload.submit()
    },
    onSuccess() {
      this.dialogVisible = false
      this.initCategories()
    },
    onError() {
      this.dialogVisible = false
    },
    loadCategories() {
      this.initCategories()
    },
    initCategories() {
      this.$store.dispatch('appmanager/getCategories', {
        name: this.name,
        state: this.state,
        type: this.type,
        page: this.page,
        size: this.size
      }).then((resp) => {
        this.categories = resp.data
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
