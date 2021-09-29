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
                data: <?php echo json_encode($data_get['all_day']) ?>,
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
            	<?php foreach ($data_get['detail_kaprog'] as $key => $value) { ?>
            		
                {
                    name: '<?php echo $value['program_keahlian']['jurusan'] ?>',
                    type: 'line',
                    data: <?php echo json_encode($value['absen_chart']); ?>,
                    smooth: true,
                    symbolSize: 7,
                    label: {
                        normal: {
                            show: true
                        } 
                    },
                    itemStyle: {
                        normal: {
                            borderWidth: 2
                        }
                    }
                },

                <?php } ?>
            ]
        });
    }
</script>
