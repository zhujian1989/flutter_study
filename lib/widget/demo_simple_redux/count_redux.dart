enum Actions { Increment, Decrement }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  } else if (action == Actions.Decrement) {
    return state - 1;
  }

  return state;
}
