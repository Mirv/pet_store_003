class Body extends React.Component {
      
  constructor(props) {
      super(props);
      this.state = {
        pets: [],
        modals: []
      };
      this.handleFormSubmit = this.handleFormSubmit.bind(this)
      this.addNewPet = this.addNewPet.bind(this)
    }
  
  handleFormSubmit(name, description){
    let body = JSON.stringify({pet: {name: name, description: description, age: age, pet_breed_id: pet_breed_id, location_id: location_id, user_id: user_id, status: status} })
    fetch('https://react005-mirv.c9users.io/api/v1/pets', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: body,
      }).then((response) => {return response.json()})
      .then((pet)=>{
        this.addNewPet(pet)
      })
      
    }
    addNewPet(pet){
      this.setState({
        fruits: this.state.pets.concat(pet)
      })
    }

  componentDidMount(){
      fetch('/api/v1/pets')
        .then((response) => {return response.json()})
        .then((data) => {this.setState({ pets: data }) });
    }  
    
  handleFormSubmit(name, description){
    console.log(name, description)
  }
    
  render(){
      return(
        <div>
          <NewPet handleFormSubmit={this.handleFormSubmit} />
          <AllPets pets={this.state.pets} />
        </div>
      )
    }
}