package engine.constraint ;

/**
 * ...
 * @author Thomas B
 */
class Constraint
{
	
	var mEntityA : Entity;
	var mEntityB : Entity;

	public function new(entityA : Entity, entityB : Entity) 
	{
		mEntityA = entityA;
		mEntityB = entityB;
	}
	
	public function resolve() {
		
	}
}