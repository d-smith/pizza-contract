contract Pizza {
    enum PizzaState {
        start, orderReceieved, assemblingPizza, cookingPizza, pizzaReady
    }

    event OrderReceived(address indexed _from, address _order);
    event AssemblingPizza(address _order);
    event CookingPizza(address _order);
    event PizzaReady(address _order);

    PizzaState public  currentState;

    modifier onlyState(PizzaState expectedState) { if (expectedState == currentState) {_;} else {throw;}}

    function Pizza() {
        currentState = PizzaState.start;
    }

    function finalizeOrder() onlyState(PizzaState.start) {
        currentState = PizzaState.orderReceieved;
        OrderReceived(msg.sender, this);
    }

    function assemblePizza() onlyState(PizzaState.orderReceieved) {
        currentState = PizzaState.assemblingPizza;
        AssemblingPizza(this);
    }

    function cookPizza() onlyState(PizzaState.assemblingPizza) {
        currentState = PizzaState.cookingPizza;
        CookingPizza(this);
    }

    function boxPizza() onlyState(PizzaState.cookingPizza) {
        currentState = PizzaState.pizzaReady;
        PizzaReady(this);
    }
}