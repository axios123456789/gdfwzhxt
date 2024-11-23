<template>
  <div class="login" v-if="isLoginVisible">
    <el-form class="form" :model="model" :rules="rules" ref="loginForm">
      <h1 class="title">供电服务管理系统</h1>
      <el-form-item prop="userName">
        <el-input
            class="text"
            v-model="model.userName"
            prefix-icon="User"
            clearable
            :placeholder="$t('login.username')"
        />
      </el-form-item>
      <el-form-item prop="password">
        <el-input
            class="text"
            v-model="model.password"
            prefix-icon="Lock"
            show-password
            clearable
            :placeholder="$t('login.password')"
        />
      </el-form-item>
      <el-form-item prop="captcha">
        <div class="captcha">
          <el-input
              class="text"
              v-model="model.captcha"
              prefix-icon="Picture"
              placeholder="请输入验证码"
          ></el-input>
          <img :src="captchaSrc" @click="refreshCaptcha" />
        </div>
      </el-form-item>
      <el-form-item>
        <el-button
            :loading="loading"
            type="primary"
            class="btn"
            size="large"
            @click="submit"
        >
          {{ btnText }}
        </el-button>
      </el-form-item>
    </el-form>
  </div>

  <div class="register" v-if="isRegisterVisible">
    <el-form class="rform" label-width="80px">
      <h1 class="title">供电公司注册</h1>
      <el-form-item label="公司账号">
        <el-input
            v-model="form.loginAccount"
            placeholder="公司账号"
            clearable
        ></el-input>
      </el-form-item>
      <el-form-item label="密码">
        <el-input placeholder="请输入密码"
                  v-model="form.loginPassword"
                  show-password>
        </el-input>
      </el-form-item>
      <el-form-item label="公司名称">
        <el-input
            v-model="form.name"
            placeholder="公司名称"
            clearable
        ></el-input>
      </el-form-item>
    </el-form>
  </div>

  <div class="change-lang">
    <change-lang />
  </div>
</template>

<script>
import {
  defineComponent,
  getCurrentInstance,
  reactive,
  toRefs,
  ref,
  computed,
  onMounted,
  watch,
} from 'vue'
import { Login, GetValidateCode, IsRegister } from '@/api/login'
import { useRouter, useRoute } from 'vue-router'
import ChangeLang from '@/layout/components/Topbar/ChangeLang.vue'
import useLang from '@/i18n/useLang'
import { useApp } from '@/pinia/modules/app'

export default defineComponent({
  components: { ChangeLang },
  name: 'login',
  setup() {
    const { proxy: ctx } = getCurrentInstance() // 可以把ctx当成vue2中的this
    const router = useRouter()
    const route = useRoute()
    const { lang } = useLang()
    watch(lang, () => {
      state.rules = getRules()
    })
    const getRules = () => ({
      userName: [
        {
          required: true,
          message: ctx.$t('login.rules-username'),
          trigger: 'blur',
        },
      ],
      password: [
        {
          required: true,
          message: ctx.$t('login.rules-password'),
          trigger: 'blur',
        },
        {
          min: 6,
          max: 12,
          message: ctx.$t('login.rules-regpassword'),
          trigger: 'blur',
        },
      ],
      captcha: [
        {
          required: true,
          message: ctx.$t('login.rules-validate-code'),
          trigger: 'blur',
        },
      ],
    })

    // 定义登录和注册模块的显示
    const isLoginVisible = ref(false);
    const isRegisterVisible = ref(false);

    // onMounted钩子函数
    onMounted( () => {
      isRegister();
    })

    //判断系统是否注册了公司
    const isRegister = async () => {
      const { data } = await IsRegister();
      if (data) { // 注册了公司
        isLoginVisible.value = true;
        isRegisterVisible.value = false;
        state.refreshCaptcha();
      } else { // 没注册公司
        isLoginVisible.value = false;
        isRegisterVisible.value = true;
      }
    }

    const form = ref({});

    const state = reactive({
      model: {
        userName: 'wangwen',
        password: '123456',
        captcha: '',      // 用户输入的验证码
        codeKey: ''       // 后端返回的验证码key
      },
      rules: getRules(),
      loading: false,
      captchaSrc: "",
      refreshCaptcha: async () => {
        const { data } = await GetValidateCode();
        state.model.codeKey = data.codeKey;
        state.captchaSrc = data.codeValue;
      },
      btnText: computed(() =>
          state.loading ? ctx.$t('login.logging') : ctx.$t('login.login')
      ),
      loginForm: ref(null),
      submit: () => {
        if (state.loading) {
          return;
        }
        state.loginForm.validate(async valid => {
          if (valid) {
            state.loading = true;
            const { code, data, message } = await Login(state.model);
            if (+code === 200) {
              ctx.$message.success({
                message: ctx.$t('login.loginsuccess'),
                duration: 1000,
              });

              const targetPath = decodeURIComponent(route.query.redirect);
              if (targetPath.startsWith('http')) {
                // 如果是一个url地址
                window.location.href = targetPath;
              } else if (targetPath.startsWith('/')) {
                // 如果是内部路由地址
                router.push(targetPath);
              } else {
                router.push('/home');    // 请求成功后，进入到首页
              }
              useApp().initToken(data);
            } else {
              ctx.$message.error(message);
            }
            state.loading = false;
          }
        });
      },
    });

    return {
      ...toRefs(state),
      isLoginVisible,
      isRegisterVisible,
      form
    };
  },
});
</script>

<style lang="scss" scoped>
.login {
  transition: transform 1s;
  transform: scale(1);
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: #2d3a4b;
  .form {
    width: 520px;
    max-width: 100%;
    padding: 0 24px;
    box-sizing: border-box;
    margin: 160px auto 0;
    :deep {
      .el-input__wrapper {
        box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.1) inset;
        background: rgba(0, 0, 0, 0.1);
      }
      .el-input-group--append > .el-input__wrapper {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
      }
      .el-input-group--prepend > .el-input__wrapper {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
      }
    }
    .title {
      color: #fff;
      text-align: center;
      font-size: 24px;
      margin: 0 0 24px;
    }
    .text {
      font-size: 16px;
      :deep(.el-input__inner) {
        color: #fff;
        height: 48px;
        line-height: 48px;
        &::placeholder {
          color: rgba(255, 255, 255, 0.2);
        }
      }
    }
    .btn {
      width: 100%;
    }
  }
}

.captcha {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 10px;
}

.captcha img {
  cursor: pointer;
  margin-left: 20px;
}

.change-lang {
  position: fixed;
  right: 20px;
  top: 20px;
  :deep {
    .change-lang {
      height: 24px;
      &:hover {
        background: none;
      }
      .icon {
        color: #fff;
      }
    }
  }
}

.register {
  transition: transform 1s;
  transform: scale(1);
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: #2d3a4b;
}
.rform{
  width: 600px;
  height: 100%;
  padding: 30px;
  background-color: #d4d5d6;
  position: absolute;
  left: 30%;
  .title {
    color: #001528;
    text-align: center;
    font-size: 24px;
    margin: 0 0 24px;
  }
}

</style>