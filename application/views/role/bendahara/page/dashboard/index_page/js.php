<script type="text/javascript">
stats();
function stats()
{
    blockui($('.load-panel'));
    send_ajax('Dashboard/stats',{} ).then( function(data){
        blockui($('.panel-result'));
        setTimeout(function(){
            unblockui($('.load-panel'));
            $('.stats').html(data); 
        }, 1000);
    });
}

$(document).on('click', '.btn-setting-pasien', function(){
    $('#modal-pasien').modal('toggle');
});
$(document).on('click','.filter-setting', function(e){
    line_chart('Dashboard/line_penerimaan','.panel-stats-pasien','line_pasien',$('#app-submit-pasien').serialize());
    $('#modal-pasien').modal('toggle');
})

$(document).on('click', '.btn-setting-keuangan', function(){
    $('#modal-keuangan').modal('toggle');
});
$(document).on('click','.filter-setting-keuangan', function(e){
    line_chart('Dashboard/line_keuangan','.panel-stats-keuangan','line_keuangan',$('#app-submit-keuangan').serialize());
    $('#modal-keuangan').modal('toggle');
})

$(document).on('change', '.tipe', function(e){
    $('.data_tipe').val($(this).find(':selected').data('opt'));
    $('.dtvalue').val($(this).find(':selected').data('dtvalue'));
})
/*echart*/
line_chart('Dashboard/line_penerimaan','.panel-stats-pasien','line_pasien',{'tipe':'D','data_tipe':'','dtvalue':'Y-m-d'});
line_chart('Dashboard/line_keuangan','.panel-stats-keuangan','line_keuangan',{'tipe':'D','data_tipe':'date','dtvalue':'Y-m-d'});

function line_chart(url, panel,id, param) {
    // console.log(param);
    blockui($(panel));
    send_ajax(url,param).then( function(data){
    var response            =   JSON.parse(data);

    var line_basic_element = document.getElementById(id);
    var line_basic = echarts.init(line_basic_element);
    setTimeout(function(){
                

        //
        // Chart config
        //

        // Options
        line_basic.setOption({

            // Define colors
            color: ['#66BB6A', '#EF5350'],

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
                data: Object.values(response.legend),
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
                data: response.key_get,
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
            series: response.value_get
            
        });
        unblockui($(panel));
            }, 1000);
    });
}
        
</script>