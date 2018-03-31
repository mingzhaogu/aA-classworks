export const postUsers = (userParams) => (
  $.ajax ({
    url: '/api/users',
    method: 'POST',
    data: {user: userParams},
    dataType: 'json'
  })
);

export const postSession = (userParams) => (
  $.ajax ({
    url: '/api/session',
    method: 'POST',
    data: {user: userParams},
    dataType: 'json'
  })
);

export const deleteSession = () => (
  $.ajax ({
    url: '/api/session',
    method: 'DELETE',
  })
);
