enum Actions { Increment, Reduce }

int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  } else if (action == Actions.Reduce) {
    return state - 1;
  }

  return state;
}
