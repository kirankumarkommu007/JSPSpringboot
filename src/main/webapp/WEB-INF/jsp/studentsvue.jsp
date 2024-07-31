<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Students" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Students List</title>
    <script src="https://unpkg.com/vue@3"></script>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div id="app">
        <h1>Students List</h1>

        <table v-if="students.length">
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
        <p v-else>No students available.</p>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const { createApp } = Vue;

            // Pass the students list directly to Vue
            var studentsData = <%= (request.getAttribute("students")) %>;

            // Debugging the JSON data
            console.log('Raw JSON data:', studentsData);

            // Initialize Vue
            createApp({
                data() {
                    return {
                        students: studentsData // Use the directly passed data
                    };
                }
            }).mount('#app');
        });
    </script>
</body>
</html>
