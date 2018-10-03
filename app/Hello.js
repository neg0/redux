export class TodoApp {
    constructor() {
        console.log('instantiated');
    }

    toString() {}
}

export function visibilityFilter(state = 'SHOW_ALL', action) {
    if (action.type === 'SET_VISIBILITY_FILTER') {
        return action.filter
    } else {
        return state
    }
}

