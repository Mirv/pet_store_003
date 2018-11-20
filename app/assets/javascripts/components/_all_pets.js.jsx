const AllPets = (props) => {
  // output
   var pets = props.pets.map((pet) => {
    return(
      
      <div key={pet.id} class="col-lg-4 col-md-5 col-sm-6">
        <li class="list-group-item d-flex justify-content-between align-items-center">
          {pet.name}
          <span class="badge badge-primary badge-pill">{pet.description}</span>
        </li>
      </div>
    )
   })
  return(
    <div>
     {pets}
    </div>
   )
  }
