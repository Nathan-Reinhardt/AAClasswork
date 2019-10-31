export const createUser= user => (
  $.ajax({
    url: `/api/users`,
    method: `POST`,
    data: { user }
  })
);
export const postLogin = user => (
  $.ajax({
    url: `/api/session`,
    method: `POST`,
    data: { user }
  })
);
export const logoutSession = () => (
  $.ajax({
    url: `/api/session`,
    method: `DELETE`
  })
);

