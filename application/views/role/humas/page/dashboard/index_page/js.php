<script type="text/javascript">
	
    var line_values_element = document.getElementById('line_values');
    if (line_values_element) {

        // Initialize chart
        var line_values = echarts.init(line_values_element);


        //
        // Chart config
        //

        // Options
        line_values.setOption({

            // Define colors
            color: ['#49C1B6', '#EA007B'],

            // Global text styles
            textStyle: {
                fontFamily: 'Roboto, Arial, Verdana, sans-serif',
                fontSize: 13
            },

            // Chart animation duration
            animationDuration: 750,

            // Setup grid
            grid: {
                left: 0,
                right: 40,
                top: 35,
                bottom: 0,
                containLabel: true
            },

            // Add legend
            legend: {
                data: ['Maximum', 'Minimum'],
                itemHeight: 8,
                itemGap: 20
            },

            // Add tooltip
            tooltip: {
                trigger: 'axis',
                backgroundColor: 'rgba(0,0,0,0.75)',
                padding: [10, 15],
                textStyle: {
                    fontSize: 13,
                    fontFamily: 'Roboto, sans-serif'
                }
            },

            // Horizontal axis
            xAxis: [{
                type: 'category',
                boundaryGap: false,
                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                axisLabel: {
                    color: '#333'
                },
                axisLine: {
                    lineStyle: {
                        color: '#999'
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: ['#eee']
                    }
                }
            }],

            // Vertical axis
            yAxis: [{
                type: 'value',
                axisLabel: {
                    formatter: '{value}',
                    color: '#333'
                },
                axisLine: {
                    lineStyle: {
                        color: '#999'
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: ['#eee']
                    }
                },
                splitArea: {
                    show: true,
                    areaStyle: {
                        color: ['rgba(250,250,250,0.1)', 'rgba(0,0,0,0.01)']
                    }
                }
            }],

            // Add series
            series: [
            	{
                    name: 'Jumlah',
                    type: 'line',
                    data: [1, 11, 2, 13, 6, 13, 10],
                    smooth: true,
                    symbolSize: 7,
                    markLine: {
                        data: [{
                            type: 'average',
                            name: 'Average'
                        }]
                    },
                    itemStyle: {
                        normal: {
                            borderWidth: 2
                        }
                    }
                },
            ]
        });
    }
</script>