
export const fetchTodos = () => {
  $.ajax({
    method: 'GET',
    url: '/api/todos',
    dataType: 'json'
  });
};
