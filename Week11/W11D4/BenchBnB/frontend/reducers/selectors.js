export const selectUsersId = (state) => Object.values(state.entities.users[state.session.id]);
