contract Pizza {
    enum PizzaState {
        start, orderReceieved
    }

    event OrderReceived(address indexed _from, address _order);

    PizzaState public  currentState;

    function Pizza() {
        currentState = PizzaState.start;
    }

    function finalizeOrder() {
        currentState = PizzaState.orderReceieved;
        OrderReceived(msg.sender, this);
    }
}