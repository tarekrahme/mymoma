import Chart from "chart.js"
import "chart.js/dist/Chart.min.css"

const transactionsData = JSON.parse(document.getElementById('transactions-data').dataset.transactions);
const today = new Date().getDay();

const days = JSON.parse(document.getElementById('transactions-data').dataset.days);
const data = []

const weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

const daysOnAxis = []


days.forEach((day) => {
  data.push(transactionsData[day])
  daysOnAxis.push(weekdays[day])
});

console.log(data);

var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: daysOnAxis,
        datasets: [{
            label: 'Amount spent',
            data: data,
            backgroundColor: [
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)'
            ],
            borderColor: [
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)',
                'rgb(41, 81, 135)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
