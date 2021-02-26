import { CanvasJSChart } from 'canvasjs-react-charts';

import reservations from '../../static/Reservations';

function Graph({ workspaceId }){

    const today = new Date();
    var startDate = new Date(today);
    startDate.setDate(today.getDate() - 10);
    var finishDate = new Date(today);
    finishDate.setDate(today.getDate() + 20);
    
    const data = reservations[workspaceId];
    var aggregatedData = {};
    Object.keys(data).forEach((key) => {
        const tempDate = new Date(data[key].date);
        if(tempDate in aggregatedData){
            aggregatedData[tempDate]++;
        }
        else if(tempDate >= startDate && tempDate <= finishDate){
            aggregatedData[tempDate] = 1;
        }
    })
    const points = Object.keys(aggregatedData).map((x) => { return { x: new Date(x), y: aggregatedData[x]}})

    const options = {
        animationEnabled: true,
        theme: "light2",
        title:{
            text: "Number of reservation in the month"
        },
        axisX:{
            valueFormatString: "DD MMM",
            crosshair: {
                enabled: true,
                snapToDataPoint: true
            }
        },
        axisY: {
            crosshair: {
                enabled: true,
                snapToDataPoint: true,
            }
        },
        data: [{
            type: "area",
            xValueFormatString: "DD MMM",
            dataPoints: points
        }]
    };

    return (
        <div>
            <CanvasJSChart options={options} />
        </div>
    );
}

export default Graph;