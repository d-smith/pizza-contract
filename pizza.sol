contract Pizza {
    enum PizzaState {
        start, orderReceieved, assemblingPizza, cookingPizza, pizzaReady
    }

    event OrderReceived(address indexed _from, address _order);
    event AssemblingPizza(address _order);
    event CookingPizza(address _order);
    event PizzaReady(address _order);

    PizzaState public  currentState;

    function Pizza() {
        currentState = PizzaState.start;
    }

    function finalizeOrder() {
        currentState = PizzaState.orderReceieved;
        OrderReceived(msg.sender, this);
    }

    function assemblePizza() {
        currentState = PizzaState.assemblingPizza;
        AssemblingPizza(this);
    }

    function cookPizza() {
        currentState = PizzaState.cookingPizza;
        CookingPizza(this);
    }

    function boxPizza() {
        currentState = PizzaState.pizzaReady;
        PizzaReady(this);
    }
}