<template>
  <div v-if="isVisible" style="width: 200px; height: 200px; background-color: #1f2d3d">

  </div>
</template>

<script setup>
   import {ref} from "vue";

   const isVisible = ref(false)
</script>

<style scoped>

</style>