// The below code is for Projects Index Page, /projects
// "show description" link is replaced with formulas descripion on click.

$(function() {
    // in the project div, when you click on .js-more ("see description" link)
    $(".project").on('click', '.js-more', function(event) {
      // this.dataset.id; grabs data-id of 'see descriptions' link, which is === project.id
      let id = this.dataset.id;

      $.get("/projects/" + id + ".json", function(data) {
        // replace div of id="description-#", "see descriptions" link with project's description
        $("#description-" + id).text(data.description);
      })
      event.preventDefault();
    })
  });

  // The below code is for Projects Form Page, /projects/#/new and /projects/#/edit
  // 'Add Task' button adds a new task input feild
  // 'x' button removes task input field
  $(document).ready(function(){
    // when 'Add Task' button is clicked:
    $('#addNewTask').click(function(){

      // create date object
      let date = new Date();

      // get number of milliseconds since midnight Jan 1, 1970, and use it for tasks key
      let mSec = date.getTime();

      // Replace 0 with milliseconds
      idAttributeTask = "project_tasks_attributes_0_name".replace("0", mSec);
      nameAttributeTask = "project[tasks_attributes][0][name]".replace("0", mSec);

      // append input feild with unique task attributes in div tasksSet
      $('div#tasksSet').append(
        `<div class='tasksForm input-group mb-3'>
          <input class='form-control' type='text' name='${nameAttributeTask}' id='${idAttributeTask}'>
          <div class='input-group-append'>
            <span class='input-group-text'>
              <button type='button' class='removeTask close'> ×</button>
            </span>
          </div>
        </div>`
      );
    });

    // when button class of .removeTask 'x' button is clicked in div of taskSet
    $("div#tasksSet").on('click', '.removeTask', function(){
      // 'this' is the 'x' button
      // 'closest' goes up thru the DOM, looking for the first ancestor with the div of class ingredientsForm
      // .remove() takes removes it from the DOM
      $(this).closest('.tasksForm').remove();
    });
  });
