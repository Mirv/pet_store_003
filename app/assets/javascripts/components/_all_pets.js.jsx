const AllPets = (props) => {
  // output
   var pets = props.pets.map((pet) => {
    return(
      <div key={pet.id} class="col-lg-4 col-md-5 col-sm-6">
        <div class="card">
          <div class="list-group-item card-body d-flex justify-content-between align-items-center">
              {pet.name}
              <span class="badge badge-primary">{pet.description}</span>
          </div>
        </div>
      </div>
    )
   })
  return(
    <div>
     {pets}
    </div>
   )
  }
