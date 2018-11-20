const AllPets = (props) => {
  // output
   var pets = props.pets.map((pet) => {
    return(
      
      <div key={pet.id} class="col-lg-4 col-md-5 col-sm-6">
        <div class="card">
          <div class="card-body d-flex justify-content-between align-items-center">
            <button type="button" onClick={this.showModal} class="btn btn-primary btn-lg btn-block">{pet.name}</button>

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
