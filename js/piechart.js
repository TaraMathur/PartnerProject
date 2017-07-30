// Prominence Pie Chart

$(function () {

    var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 80, 81, 56, 55, 40],
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 86, 27, 90]
        }
    ]
};

    var option = {
    responsive: true,
    };
   
    // Get the context of the canvas element we want to select
    var ctx = document.getElementById("myChart").getContext('2d');
    var myPieChart = new Chart(ctx).Line(data, option); //'Pie' defines type of the chart.
 /*   document.getElementById("legendDiv").innerHTML = myLineChart.generateLegend(); */
});

// Time Pie Chart

$(function () {

var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 80, 81, 56, 55, 40]
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 86, 27, 90]
        }
    ]
};

    var option = {
    responsive: true,
    };
    // Get the context of the canvas element we want to select
    var ctx = document.getElementById("myChart2").getContext('2d');
    var myLineChart = new Chart(ctx).Line(data, option); //'Pie' defines type of the chart.
/*    document.getElementById("legendDiv2").innerHTML = myLineChart.generateLegend(); */
});

// Size Pie Chart

$(function () {

    var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [0, 0.5, 1, 1, 0, .75, 1]
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [0, 0.5, 1, 1, 0, .75, 1]
        }
    ]
};

    var option = {
    responsive: true,
    };
   
   
    // Get the context of the canvas element we want to select
    var ctx = document.getElementById("myChart3").getContext('2d');
    var myLineChart = new Chart(ctx).Line(data, option); //'Pie' defines type of the chart.
  /*  document.getElementById("legendDiv3").innerHTML = myLineChart.generateLegend(); */
});
