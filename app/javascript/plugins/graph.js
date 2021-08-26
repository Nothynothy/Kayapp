src="https://cdn.jsdelivr.net/npm/chart.js"


// import { Chart, registerables } from 'chart.js';
// OU
// import { Chart } from 'chart.js/lib/systems/variation';
// OU
import Chart from 'chart.js/auto';



const waterGraph = () => {
  // CONFIG
  const config = {
    type: 'line',
    data: data,
    options: {}
  };
  // SET UP
  const labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];
  const data = {
    labels: labels,
    datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: [0, 10, 5, 2, 20, 30, 45],
    }]
  };
  // === include 'setup' then 'config' above ===
  var myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
}
export {waterGraph}
