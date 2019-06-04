import Chart from "chart.js"
import "chart.js/dist/Chart.min.css"

const transactionsData = JSON.parse(document.getElementById('transactions-data').dataset.transactions);
const today = new Date().getDay();

const days = JSON.parse(document.getElementById('transactions-data').dataset.days);
const data = []

const weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S']

const daysOnAxis = []


days.forEach((day) => {
  data.push(transactionsData[day])
  daysOnAxis.push(weekdays[day])
});

console.log(data);

var ctx = document.getElementById('myChart');
if (ctx) {
  var ctxChart = ctx.getContext('2d');
  var myChart = new Chart(ctxChart, {
      type: 'bar',
      data: {
          labels: daysOnAxis,
          datasets: [{
              label: 'Amount spent',
              data: data,
              backgroundColor: [
                  '#406aec',
                  '#406aec',
                  '#406aec',
                  '#406aec',
                  '#406aec',
                  '#406aec',
                  '#406aec'
              ],
              borderColor: [
                  '#406aec',
                  '#406aec',
                  '#406aec',
                  '#406aec',
                  '#406aec',
                  '#406aec',
                  '#406aec'
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
            xAxes: [{
              gridLines: {
                  display:false
              }
            }],
            yAxes: [{
                ticks: {
                    beginAtZero: true
                },
                gridLines: {
                  display:false
                }
            }]
          }
      }
  });
}

ctx.style.backgroundColor = '#EDF1FE';
