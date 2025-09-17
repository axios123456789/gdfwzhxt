<template>
  <el-tabs type="border-card" class="analyseDT">
    <el-tab-pane label="客户提成可视化">
      <div
        ref="chart"
        style="width: 1000px; height: 700px; margin-left: 140px"
      ></div>
    </el-tab-pane>
    <!--    <el-tab-pane label="报表分析">报表</el-tab-pane>-->
  </el-tabs>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import * as echarts from 'echarts'
import { GetCustomerAnalyseData } from '@/api/saleManage'

onMounted(() => {
  getCustomerAnalyseData()
})

//--------------------------------------------------------客户提成金额可视化------------------------------------------
const chart = ref() //客户提成金额

//获取客户分析数据
const getCustomerAnalyseData = async () => {
  const { data } = await GetCustomerAnalyseData()
  setChartOption(data)
}

//客户提成金额echarts渲染
const setChartOption = data => {
  //获取最大值
  let maxData = 0
  for (let i = 0; i < data.dataList.length; i++) {
    if (data.dataList[i].value >= maxData) {
      maxData = data.dataList[i].value
    }
  }
  //console.log("数据："+maxData)

  const myChart = echarts.init(chart.value)
  // 指定图表的配置项和数据
  const option = {
    title: {
      text: '提成金额前六客户可视化',
    },
    tooltip: {
      trigger: 'item',
      formatter: '{a} <br/>{b} : {c}(元)',
    },
    toolbox: {
      feature: {
        dataView: { readOnly: false },
        restore: {},
        saveAsImage: {},
      },
    },
    legend: {
      data: data.dataTitle,
    },
    series: [
      {
        name: 'Funnel',
        type: 'funnel',
        left: '10%',
        top: 60,
        bottom: 60,
        width: '80%',
        min: 0,
        max: maxData,
        minSize: '0%',
        maxSize: '100%',
        sort: 'descending',
        gap: 2,
        label: {
          show: true,
          position: 'inside',
        },
        labelLine: {
          length: 10,
          lineStyle: {
            width: 1,
            type: 'solid',
          },
        },
        itemStyle: {
          borderColor: '#fff',
          borderWidth: 1,
        },
        emphasis: {
          label: {
            fontSize: 20,
          },
        },
        data: data.dataList,
      },
    ],
  }
  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option)
}
</script>

<style scoped>
.analyseDT {
  position: relative;
  width: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
  overflow: auto;
}

.analyseDT::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: url('src/assets/lsdq.png');
  background-size: cover;
  background-attachment: fixed;
  opacity: 0.5; /* 设置背景图片的透明度为50% */
  /*z-index: -1; !* 确保伪元素在内容下方 *!*/
}
.analyseDT > * {
  position: relative;
  z-index: 1; /* 确保内容在伪元素上方 */
}
</style>
