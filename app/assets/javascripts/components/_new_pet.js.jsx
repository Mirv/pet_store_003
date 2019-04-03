const NewPet = (props) => {
  let formFields = {}
 
  return(
    <form onSubmit={ (e) => { props.handleFormSubmit(formFields.name.value, formFields.description.value); e.target.reset();}
}>
   
     <input ref={input => formFields.name = input} placeholder='Enter the name'/>
     <input ref={input => formFields.description = input} placeholder='Enter a description' />
     <input ref={input => formFields.age = input} placeholder='Enter age' />
     <input ref={input => formFields.pet_breed_id = input} placeholder='Enter breed id' />
     <input ref={input => formFields.user_id = input} placeholder='Enter user_id 1 for A' />
     <input ref={input => formFields.status = input} placeholder='Enter status 2 for active' />
     <input ref={input => formFields.location_id = input} placeholder='Enter location 2 for active' />
     <button>Submit</button>
    </form>
  )
}