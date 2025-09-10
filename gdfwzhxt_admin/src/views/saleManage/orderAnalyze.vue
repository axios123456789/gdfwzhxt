<template>
  <el-tabs type="border-card" class="analyseDT">
    <el-tab-pane label="可视化分析">
      <div
        ref="chart"
        style="width: 1000px; height: 700px; margin-left: 140px"
      ></div>
    </el-tab-pane>
    <el-tab-pane label="报表分析">报表</el-tab-pane>
  </el-tabs>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import * as echarts from 'echarts'

onMounted(() => {
  setChartOption()
})
const chart = ref()
const setChartOption = () => {
  const myChart = echarts.init(chart.value)
  // 指定图表的配置项和数据
  const option = {
    title: {
      text: 'Funnel',
    },
    tooltip: {
      trigger: 'item',
      formatter: '{a} <br/>{b} : {c}',
    },
    toolbox: {
      feature: {
        dataView: { readOnly: false },
        restore: {},
        saveAsImage: {},
      },
    },
    legend: {
      data: ['Show', 'Click', 'Visit', 'Inquiry', 'Order'],
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
        max: 100,
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
        data: [
          { value: 60, name: 'Visit' },
          { value: 40, name: 'Inquiry' },
          { value: 20, name: 'Order' },
          { value: 80, name: 'Click' },
          { value: 50, name: 'Show' },
        ],
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
