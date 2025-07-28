<template>
  <div class="container">
    <div class="header">
      <h1>消息系统</h1>
      <div class="links">
        <a href="/api/swagger" target="_blank">Scalar API 文档</a>
        <a href="/api/swagger-ui" target="_blank">Swagger UI</a>
      </div>
    </div>
    
    <div class="message-form">
      <input 
        v-model="author" 
        placeholder="你的名字" 
        class="input"
      />
      <textarea 
        v-model="content" 
        placeholder="输入消息..." 
        class="textarea"
      />
      <button @click="sendMessage" :disabled="!author || !content" class="button">
        发送消息
      </button>
    </div>

    <div class="messages">
      <h2>消息列表</h2>
      <div v-if="loading">加载中...</div>
      <div v-else-if="error" class="error">{{ error }}</div>
      <div v-else>
        <div v-for="msg in messages" :key="msg.id" class="message">
          <strong>{{ msg.author }}</strong>
          <span class="time">{{ formatTime(msg.created_at) }}</span>
          <p>{{ msg.content }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const author = ref('')
const content = ref('')
const messages = ref<any[]>([])
const loading = ref(true)
const error = ref('')

const loadMessages = async () => {
  loading.value = true
  error.value = ''
  try {
    const result = await $fetch('/api/messages')
    if (result.success) {
      messages.value = result.messages || []
    } else {
      error.value = result.error || '加载失败'
    }
  } catch (e) {
    error.value = '网络错误'
  } finally {
    loading.value = false
  }
}

const sendMessage = async () => {
  if (!author.value || !content.value) return
  
  try {
    const result = await $fetch('/api/messages', {
      method: 'POST',
      body: {
        author: author.value,
        content: content.value
      }
    })
    
    if (result.success) {
      content.value = ''
      await loadMessages()
    } else {
      alert(result.error || '发送失败')
    }
  } catch (e) {
    alert('网络错误')
  }
}

const formatTime = (time: string) => {
  return new Date(time).toLocaleString('zh-CN')
}

onMounted(() => {
  loadMessages()
  // 每5秒刷新一次
  setInterval(loadMessages, 5000)
})
</script>

<style scoped>
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.message-form {
  background: #f5f5f5;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 30px;
}

.input, .textarea {
  width: 100%;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.textarea {
  min-height: 100px;
  resize: vertical;
}

.button {
  background: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.button:disabled {
  background: #ccc;
}

.messages {
  margin-top: 30px;
}

.message {
  background: #f9f9f9;
  padding: 15px;
  margin-bottom: 10px;
  border-radius: 4px;
  border-left: 3px solid #007bff;
}

.time {
  color: #666;
  font-size: 0.9em;
  margin-left: 10px;
}

.error {
  color: red;
  padding: 10px;
  background: #fee;
  border-radius: 4px;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.links {
  display: flex;
  gap: 15px;
}

.links a {
  color: #007bff;
  text-decoration: none;
  padding: 8px 16px;
  border: 1px solid #007bff;
  border-radius: 4px;
  transition: all 0.3s;
}

.links a:hover {
  background: #007bff;
  color: white;
}
</style>