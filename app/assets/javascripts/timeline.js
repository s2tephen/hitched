$(document).ready(function(){
	var margin = {top: 0, right: 0, bottom: 12, left: 24};

	var dataset;
	var url = location.protocol+"//"+location.host+"/weddings/"+$("#timeline").attr("data-wedding")+".json";

	$.getJSON(url, function(data) {
		dataset = data["events"];

		var view = "stacked";
		var colors = {"guests":"#CE1836","ceremony":"#009989","decorations":"#EDB92E","food":"#F85931","bridegroom":"#A3A948","gifts":"#3443A6","party":"#492D61"};
		var yVals = {"guests":70,"ceremony":210,"decorations":140,"food":105,"bridegroom":175,"gifts":245,"party":280};
		var ttInit = $("#tooltip").height();
	    				
		var x = d3.time.scale()
			.domain([new Date($("#timeline").attr("data-created")), new Date($("#timeline").attr("data-date"))])
			.range([0, 870]);

		var y = d3.scale.linear()
			.domain([0, 20])
			.range([300, 0]);

		var svg = d3.select("#timeline")
					.append("svg")
						.attr("width", "100%")
						.attr("height", "100%");
						// .call(d3.behavior.zoom().x(x).scaleExtent([1, 8]).on("zoom", zoom));

		var xAxis = d3.svg.axis()
			.scale(x)
			.orient("bottom")
			.ticks(d3.time.months, 1)
			.tickSize(0, 0, 0)
	    	.tickFormat(d3.time.format('%b'));

	    var xWeeks = d3.svg.axis()
			.scale(x)
			.orient("bottom")
			.ticks(d3.time.weeks, 1)
			.tickSize(300, 0, 0)
	        .tickFormat("");

	    var xMonths = d3.svg.axis()
			.scale(x)
			.orient("bottom")
			.ticks(d3.time.months, 1)
			.tickSize(300, 0, 0)
	        .tickFormat("");

		svg.append("g")         
	        .attr("class", "grid")
	        .attr("transform", "translate(0, 0)")
	        .call(xWeeks);

	    svg.append("g")         
	        .attr("class", "grid")
	        .attr("class", "months")
	        .attr("transform", "translate(0, 0)")
	        .call(xMonths);

		svg.append("g")
	    	.attr("class", "x axis")
	    	.attr("transform", "translate(0, 0)")
		    .call(xAxis)
		    .selectAll("text")
		    	.style("text-anchor", "start")
		    	.attr("dx", ".8em")
		    	.attr("dy", "1.6em");

		svg.selectAll("circle")
			.data(dataset)
			.enter()
			.append("svg:circle")
			.attr("class", function(d) {
				return "circle "+d.category;
			})
			.attr('cx', function(d) {
				return x(new Date(d.date));
			})
			.attr("cy", function(d) {
				return yVals[d.category];
			})
			.attr("stroke", function(d) {
				return colors[d.category];
			})
			.attr("stroke-width", "5")
			.attr("fill", "transparent")
			.attr("r", 8)
			.on('mouseover', function(d){
				var width = $("#timeline").width();
				d3.selectAll(".circle").transition()
							.duration(100)
							.attr("r", 8);
				d3.select(this).transition()
							.duration(150)
							.attr("r", 10);
				d3.select("#name").text(d.name);
				d3.select("#when").text(new Date(d.date).toDateString());
				d3.select("#tooltip-link").attr("href", "/events/"+d.id);
				var ttHeight = $("#tooltip").height();
				var xPos = x(new Date(d.date))+$("#timeline").position().left-83;
				if (ttHeight > ttInit) {
					var yPos = $("#timeline").position().top+yVals[d.category]-130-(ttHeight-ttInit);
				} else {
					var yPos = $("#timeline").position().top+yVals[d.category]-130;
				}
				d3.select("#tooltip")
							.classed("hidden", false)
							.attr("data-category", d.category)
							.style("left", xPos + "px")
							.style("top", yPos + "px")
							.style("border-top", "15px solid "+colors[d.category]);			
			})

		$(".close").click(function() {
			$("#tooltip").addClass("hidden");
			d3.selectAll(".circle").transition()
							.duration(100)
							.attr("r", 8);
		});

		svg.append("line")
			.attr("x1", function() {
				return x(new Date());
			})
			.attr("x2", function() {
				return x(new Date());
			})
			.attr("y1", 0)
			.attr("y2", 300)
			.attr("stroke", "#666")
			.attr("stroke-width", "2px");

		svg.append("rect")
			.attr("class", "passed")
			.attr("width", function() {
				return x(new Date())-1;
			})
			.attr("height", 300)
			.style("fill", "black")
			.style("fill-opacity", "0.2");

		$(".timeline-toggle").click(function() {
			var category = $(this).attr("id").substring(7);
			if ($(this).hasClass("enabled")) {
				$(this).removeClass("enabled");
				d3.selectAll("."+category).attr("class", "circle "+category);
			}
			else {
				$(this).addClass("enabled");
				d3.selectAll("."+category).attr("class", "circle hidden "+category);
			}
		});

		$(".timeline-view").click(function() {
			if ($(this).is("#stacked") && view != "stacked") {
				$(this).addClass("active");
				$("#combined").removeClass("active");
				view = "stacked";
				yVals = {"guests":70,"ceremony":210,"decorations":140,"food":105,"bridegroom":175,"gifts":245,"party":280};
			}
			else if ($(this).is("#combined") && view != "combined") {
				$(this).addClass("active");
				$("#stacked").removeClass("active");
				view = "combined";
				yVals = {"guests":280,"ceremony":280,"decorations":280,"food":280,"bridegroom":280,"gifts":280,"party":280};
			}
			svg.selectAll("circle")
				.transition()
				.duration(750)
				.attr("cy", function(d) {
					return yVals[d.category];
				});
			var ttHeight = $("#tooltip").height();
			if (ttHeight > ttInit) {
				var yPos = $("#timeline").position().top+yVals[$("#tooltip").attr("data-category")]-130-(ttHeight-ttInit);
			}
			else {
				var yPos = $("#timeline").position().top+yVals[$("#tooltip").attr("data-category")]-130;
			}
			d3.select("#tooltip")
				.transition()
				.duration(750)
				.style("top", yPos + "px");
		});

	});

	function zoom() {
			svg.select(".x.axis").call(xAxis);
	}

});