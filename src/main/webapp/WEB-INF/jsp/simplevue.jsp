<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vue.js Integration with JSP</title>
    <!-- Vue 3 CDN -->
    <script src="https://unpkg.com/vue@3"></script>
</head>
<body>
    <div id="app">
        <h1>{{students}}</h1>
        <h1 v-if="isVisible" v-text="students"></h1>
        <h1 v-else>No message to display</h1>
        <button @click="toggleVisibility">Toggle Message</button>
    </div>

  <!-- Vue 3 Application Script -->
    <script>
        // Retrieve the JSON data from the JSP model attribute and ensure it's correctly formatted
        const message = `<%= (request.getAttribute("message")) %>`;

        const app = Vue.createApp({
            data() {
                return {
                    students:message, // Parse the JSON data into a JavaScript object
                    isVisible: true
                };
            },
            methods: {
                toggleVisibility() {
                    this.isVisible = !this.isVisible;
                    console.log(this.isVisible);
                }
            }
        });

        app.mount('#app');
    </script>

</body>
</html>
