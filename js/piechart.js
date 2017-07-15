// Code to be written before we can create the frame-level charts we need for each logo:
// Open the file from Netra, loop through it and build a line chart for the top 5 brands:
// - The x axis will be frames/time
// - The y axis will be the logo area size at each point in time


// Prominence Pie Chart

$(function () {

    var data = [
        {
            value: 1412,
            color:"#7763DB",
            highlight: "#FF5A5E",
            label: "GMC"
        },
        {
            value: 908,
            color: "#1DAFF5",
            highlight: "#5AD3D1",
            label: "ESPN"
        },
        {
            value: 596,
            color: "#DCDCDC",
            highlight: "#FFC870",
            label: "NFL"
        }
    ]

    var option = {
    responsive: true,
    };
   
    // Get the context of the canvas element we want to select
    var ctx = document.getElementById("myChart").getContext('2d');
    var myPieChart = new Chart(ctx).Pie(data, option); //'Pie' defines type of the chart.
    document.getElementById("legendDiv").innerHTML = myPieChart.generateLegend();
});

// Time Pie Chart

$(function () {

    var data = [
        {
            value: 1412,
            color:"#7763DB",
            highlight: "#FF5A5E",
            label: "GMC"
        },
        {
            value: 908,
            color: "#1DAFF5",
            highlight: "#5AD3D1",
            label: "ESPN"
        },
        {
            value: 596,
            color: "#DCDCDC",
            highlight: "#FFC870",
            label: "NFL"
        }
    ]

    var option = {
    responsive: true,
    };
   
    // Get the context of the canvas element we want to select
    var ctx = document.getElementById("myChart2").getContext('2d');
    var myPieChart = new Chart(ctx).Pie(data, option); //'Pie' defines type of the chart.
    document.getElementById("legendDiv2").innerHTML = myPieChart.generateLegend();
});

// Size Pie Chart

$(function () {

    var data = [
        {
            value: 1412,
            color:"#7763DB",
            highlight: "#FF5A5E",
            label: "GMC"
        },
        {
            value: 908,
            color: "#1DAFF5",
            highlight: "#5AD3D1",
            label: "ESPN"
        },
        {
            value: 596,
            color: "#DCDCDC",
            highlight: "#FFC870",
            label: "NFL"
        }
    ]

    var option = {
    responsive: true,
    };
   
    // Get the context of the canvas element we want to select
    var ctx = document.getElementById("myChart3").getContext('2d');
    var myPieChart = new Chart(ctx).Pie(data, option); //'Pie' defines type of the chart.
    document.getElementById("legendDiv3").innerHTML = myPieChart.generateLegend();
});
