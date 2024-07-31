<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Students List</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@3"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            text-align: center;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
        }
        nav a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
            display: block;
        }
        nav a:hover {
            background-color: #575757;
        }
        .container {
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
            text-align: left;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Student Management System</h1>
    </header>
    <nav>
        <a href="/vue">Home</a>
        <a href="/students">Students</a>
        <a href="/about">About</a>
    </nav>
    <div class="container" id="app">
        <h2>Students List</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Subject</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="student in students" :key="student.id">
                    <td>{{ student.id }}</td>
                    <td>{{ student.name }}</td>
                    <td>{{ student.subject }}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <footer>
        <p>&copy; 2024 Student Management System</p>
    </footer>
    <script>
        const { createApp, ref, onMounted } = Vue;

        createApp({
            setup() {
                const students = ref([]);

                onMounted(() => {
                    axios.get('/api/students')
                        .then(response => {
                            students.value = response.data;
                            console.log(response.data);
                        })
                        .catch(error => {
                            console.error("There was an error fetching the students data:", error);
                        });
                });

                return {
                    students
                };
            }
        }).mount('#app');
    </script>
</body>
</html>
