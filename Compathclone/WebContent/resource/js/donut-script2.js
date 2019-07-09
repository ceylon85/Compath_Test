$(window).on("load", function() {
	Morris.Donut({
		element : "donut-chart1",
		data : [ {
			value : 70,
			label : '삼성'
		}, {
			value : 15,
			label : '윤기찡'
		}, {
			value : 10,
			label : 'baz'
		}, {
			value : 5,
			label : 'A really really long label'
		} ],
		resize : !0,
		colors : [ "#00A5A8", "#FF7D4D", "#FF4558", "#626E82" ]
	})
});
