$( document ).on("turbolinks:load", function(){
    progressbar_nodes = $(".progressbar")
    progressbar_nodes.each(function() {
        progressbar_node_id = "#" + this.id
        max_value = $(progressbar_node_id).attr("max_value")
        current_value = $(progressbar_node_id).attr("current_value")
        $(progressbar_node_id).text("")
        console.log(progressbar_node_id + ": " + current_value + "/" + max_value)

        init_circle(progressbar_node_id, max_value, current_value)
    })
})

function init_circle(node_id, max_value, current_value){
    var bar = new ProgressBar.SemiCircle(progressbar_node_id, {
      strokeWidth: 6,
      color: '#FFEA82',
      trailColor: '#eee',
      trailWidth: 1,
      easing: 'easeInOut',
      duration: 1400,
      svgStyle: null,
      text: {
        value: '',
        alignToBottom: false
      },
      from: {color: '#FFEA82'},
      to: {color: '#ED6A5A'},
      // Set default step function for all animate calls
      step: (state, bar) => {
        bar.path.setAttribute('stroke', state.color);
        var value = Math.round(bar.value() * max_value);
        bar.setText(value + "/" + max_value);

        bar.text.style.color = state.color;
      }
    });
    bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
    bar.text.style.fontSize = '2rem';

    bar.animate(current_value / max_value);  // Number from 0.0 to 1.0
}
