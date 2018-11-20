class Body extends React.Component {
    
  constructor(props) {
      super(props);
      this.state = {
        pets: []
      };
    }
  
  componentDidMount(){
      fetch('/api/v1/pets')
        .then((response) => {return response.json()})
        .then((data) => {this.setState({ pets: data }) });
    }  
    
  render(){
      return(
        <div>
          <table class="table table-hover">
            <tbody>
              <AllPets pets={this.state.pets} />
            </tbody>
          </table>
        </div>
      )
    }
}