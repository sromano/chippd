function PostPresenter (template,data) {
  this.data = data;
  this.data["created_at"] = $.format.date(this.data["created_at"],"MMMM d, yyyy");
  this.data["rating-stars"] = Array(this.data["rating"]+1).join("*");
  this.data["rating"] = Number(this.data["rating"]).toFixed(1);
    this.getHTML = function() {
    return Mustache.render(template, this.data);
  }
};

function BlogPresenter(blogElement,templateElement, data){
  this.blogElement = blogElement;
  this.data = data;
  this.template = $(templateElement).html();
  this.getHTML = function() {
    var blog = $(this.blogElement);
    var template = this.template;
    $.each(this.data, function( index, value ) {
      blog.append(new PostPresenter(template,value).getHTML());
    });
  }
};
