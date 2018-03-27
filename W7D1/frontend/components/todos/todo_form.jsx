import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
    };

    this.onInputTitle = this.onInputTitle.bind(this);
    this.onInputBody = this.onInputBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  onInputTitle(e) {
    e.preventDefault();
    return this.setState({ title: e.target.value });
  }

  onInputBody(e) {
    e.preventDefault();
    return this.setState({ body: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: new Date().getTime() });
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: "",
    });
  }


  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>New Todo
          <input type="text"
            value={this.state.title}
            onChange={this.onInputTitle}/>
        </label>

        <label>Body
          <input type="text"
            value={this.state.body}
            onChange={this.onInputBody}/>
        </label>

        <button>Create!</button>
      </form>
    );
  }
}

export default TodoForm;
