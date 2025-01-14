<template>
  <div class="app-container">
    <!--表单-->
    <el-form :inline="true" class="demo-form-inline">

      <el-form-item>
        <el-select v-model="searchObj.type" clearable placeholder="请选择">
          <el-option label="学员登录数统计" value="login_num"/>
          <el-option label="学员注册数统计" value="register_num"/>
          <el-option label="课程播放数统计" value="video_view_num"/>
          <el-option label="每日课程数统计" value="course_num"/>
        </el-select>
      </el-form-item>

      <el-form-item>
        <el-date-picker
          v-model="searchObj.begin"
          type="date"
          placeholder="选择开始日期"
          value-format="yyyy-MM-dd" />
      </el-form-item>
      <el-form-item>
        <el-date-picker
          v-model="searchObj.end"
          type="date"
          placeholder="选择截止日期"
          value-format="yyyy-MM-dd" />
      </el-form-item>
      <el-button
        :disabled="btnDisabled"
        type="primary"
        icon="el-icon-search"
        @click="showChart()">查询</el-button>
    </el-form>

    <div class="chart-container">
      <div id="chart" class="chart" style="height:500px;width:100%" />
    </div>
  </div>
</template>
<script>
import * as echarts from 'echarts'
import staApi from '@/api/sta'

export default {
    data() {
        return {
            searchObj:{
              type: 'video_view_num',
              begin: '2022-12-12',
              end: '2022-12-13',
            },
            btnDisabled:false,
            xData:[],
            yData:[]
        }
    },
    created(){
      this.showChart()
    },
    methods:{
        showChart() {
            staApi.getDataSta(this.searchObj)
                .then(response => {
                    // console.log('*****************'+response)
                    this.yData = response.data.numDataList
                    this.xData = response.data.date_calculatedList

                    //调用下面生成图表的方法，改变值
                    this.setChart()
                })
        },
        setChart() {
            // 基于准备好的dom，初始化echarts实例
            this.chart = echarts.init(document.getElementById('chart'))
            // console.log(this.chart)

            // 指定图表的配置项和数据
            var option = {

              //写在option中，这样会在图形右上角产生一个保存为图片的标识，点击即可下载图片，这种方法试用于网站点击保存的需求
              toolbox: {
                show: true,
                feature: {
                  saveAsImage: {
                    show:true,
                    excludeComponents :['toolbox'],
                    pixelRatio: 2
                  }
                }
              },

                title: {
                    text: '数据统计'
                },
                tooltip: {
                    trigger: 'axis'
                },
              //下方区域缩放可以拖动显示日期
                dataZoom: [{
                    show: true,
                    height: 30,
                    xAxisIndex: [
                        0
                    ],
                    bottom: 30,
                    start: 10,
                    end: 80,
                    handleIcon: 'path://M306.1,413c0,2.2-1.8,4-4,4h-59.8c-2.2,0-4-1.8-4-4V200.8c0-2.2,1.8-4,4-4h59.8c2.2,0,4,1.8,4,4V413z',
                    handleSize: '110%',
                    handleStyle: {
                        color: '#d3dee5'

                    },
                    textStyle: {
                        color: '#fff'
                    },
                    borderColor: '#90979c'
                    },
                    {
                    type: 'inside',
                    show: true,
                    height: 15,
                    start: 1,
                    end: 35
                 }],
                // x轴是类目轴（离散数据）,必须通过data设置类目数据
                xAxis: {
                    type: 'category',
                    data: this.xData
                },
                // y轴是数据轴（连续数据）
                yAxis: {
                    type: 'value'
                },
                // 系列列表。每个系列通过 type 决定自己的图表类型
                series: [{
                    // 系列中的数据内容数组
                    data: this.yData,
                    // 折线图
                    type: 'line'
                }]
            }

            this.chart.setOption(option)
        }
    }
}
</script>
