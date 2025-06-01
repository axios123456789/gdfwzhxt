<template>
  <button @click="fh">返回</button>
</template>

<script setup>
import { useRoute } from 'vue-router'
import router from '@/router'

const route = useRoute()

const fh = () => {
  // 返回锁屏前的页面
  router.push({ path: route.query.redirect || '/', replace: true })
}
</script>

<style scoped></style>
