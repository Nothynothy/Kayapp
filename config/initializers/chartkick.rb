# From doc Chartkikck https://github.com/ankane/chartkick/
# https://www.chartjs.org/docs/latest/samples/line/line.html => Config
# For options generales, cf. partie 'Global Options' %>

# Ruby
Chartkick.options = {
  responsive: true,
  plugins: {
    legend: {
      position: 'top'
    },
    title: {
      display: true,
      text: 'Chart.js Line Chart'
    }
  }
}
