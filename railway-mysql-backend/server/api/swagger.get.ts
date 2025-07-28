export default defineEventHandler((event) => {
  const html = `
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>API 文档 - Railway MySQL Backend</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body { margin: 0; font-family: Arial, sans-serif; }
    #api-reference { height: 100vh; }
  </style>
</head>
<body>
  <div id="api-reference"></div>
  <script src="https://cdn.jsdelivr.net/npm/@scalar/api-reference"></script>
  <script>
    ApiReference({
      spec: {
        url: '/api/openapi.json'
      },
      theme: 'purple',
      layout: 'modern',
      showSidebar: true,
      darkMode: true
    }, document.getElementById('api-reference'))
  </script>
</body>
</html>
  `
  
  event.node.res.setHeader('Content-Type', 'text/html')
  return html
})