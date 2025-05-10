package OSCALCatalog {
	
	
	attribute def ID :> ScalarValues::String;
	attribute def Label :> ScalarValues::String;
	attribute def Namespace :> ScalarValues::String;
	attribute def Version :> ScalarValues::String;
	attribute def Name :> ScalarValues::String;
	attribute def Value :> ScalarValues::String;
	attribute def Propose :> ScalarValues::String;
	attribute def Text :> ScalarValues::String;
	attribute def Prose :> ScalarValues::String;
	attribute def HowMany :> ScalarValues::String;
	attribute def Choice :> ScalarValues::String;
	attribute def HRef :> ScalarValues::String;
	attribute def Citation :> ScalarValues::String;
	attribute def UUID :> ScalarValues::String;
	attribute def EmailAddress :> ScalarValues::String;

	attribute def Guideline {
		attribute proses : Prose [*];
	}

	enum def RoleID {
		enum creator;
		enum contact;
	}
	enum def Class {
		enum sp800_53A;
		enum sp800_53;
		enum family;
		enum sp800_53Enhancement;
		enum zeroPadded;
	}

	enum def Relate {
		enum versionHistory;
		enum alternate;
		enum canonical;
		enum cprt;
		enum reference;
		enum related;
		enum incorporatedInto;
		enum movedTo;
		enum required;
		enum assessmentFor;
	}
	attribute def Link {
		attribute href : HRef;
		attribute relate : Relate;
	}

	attribute def Revision {
		attribute title : ScalarValues::String;
		attribute lastModified : ScalarValues::String;
		attribute version : Version;
		attribute oscalVersion : ScalarValues::String;
		attribute links : Link [*];
		attribute remarks : Text [*];
	}

	attribute def Property {
		attribute name : Name;
		attribute value : Value;
		attribute class : Class;
		attribute ns : Namespace;
	}

	part def Role {
		attribute id : ID;
		attribute title : ScalarValues::String;
	}

	attribute def Address {
		attribute addressLines : ScalarValues::String [*];
		attribute city : ScalarValues::String;
		attribute _state : ScalarValues::String;
		attribute postalCode : ScalarValues::String;
	}

	part def Party {
		attribute uuid : UUID;
		attribute type : ScalarValues::String;
		attribute emailAddresses : EmailAddress [*];
		attribute addresses : Address [*];
	}

	part def ResponsibleParty {
		attribute roleID : RoleID;
		attribute partyUUIDs : UUID [*];
	}

	part def Resource {
		attribute uuid : UUID;
		attribute title : ScalarValues::String;
		attribute citation : Citation;
		attribute rlinks : Link [*];
	}

	attribute def Select {
		attribute howMany : HowMany;
		attribute choices : Choice [*];
	}

	public import ScalarValues;
	public import ISQSpaceTime::*;

	part def Part {
		attribute id : ID;
		attribute name : Name;
		attribute prose : Prose;
		attribute properties : Property [*];
		attribute links : Link [*];
		attribute partIds : ID [*];
		part parts : Part [*];
	}

	part def Parameter {
		attribute paramId : ID;
		attribute label : Label;
		attribute properties : Property [*];
		attribute guidelines : Guideline [*];
		attribute select : Select;
	}

	attribute def Metadata {
		attribute title : Text;
		attribute lastModified : TimeValue;
		attribute version : Version;
		attribute oscalVersion : Version;
		attribute revisions : Revision [*];
		attribute properties : Property [*];
		attribute links : Link [*];
		part roles : Role [*];
		part parties : Party [*];
		part responsibleParties : ResponsibleParty [*];
	}

	attribute def BackMatter {
		part resources : Resource [*];
	}

	part def <Safeguard> Control {
		attribute <control_id> id : ID;
		attribute <class> _class : Class;
		attribute <control_name> title : ScalarValues::String;
		attribute properties : Property [*];
		attribute links : Link [*];
		attribute description : Text;
		attribute relatedControls : ID [*];
		part parameters : Parameter [*];
		part parts : Part [*];
		part controls : Control [*];
	}

	part def <Family> Group {
		attribute <family_id> id : ID;
		attribute _class : Class;
		attribute <family_name> title : Text;
		part <safeguards> controls : Control [*];
	}

	part def Catalog {
		attribute uuid : UUID;
		attribute _metadata : Metadata;
		part groups : Group [*];
		attribute backMatter : BackMatter;
	}
}

package ControlBaseline {
	public import OSCALCatalog::*;
	enum def Baseline {
		enum Low;
		enum Moderate;
		enum High;
	}

	part def Control:> OSCALCatalog::Control {
//		attribute id : ID;
//		attribute controlName : Name;
//		attribute relatedControls : ID [*];
		attribute controlText : Text;
		attribute discussion : Text;
		attribute withdrawn : ScalarValues::Boolean;
		attribute privacy : ScalarValues::Boolean;
		enum baselines : Baseline [*];
	}

	part def AssessmentProcedure {
		attribute id : ID;
		attribute family : Name;
		attribute sortAs : ID;
		attribute controlName : Name;
		attribute assessmentObjective : Text;
		attribute examines : Text [*];
		attribute interviews : Text [*];
		attribute tests : Text [*];
	}

	part assesmentProcedures : AssessmentProcedure [*];
	part controls : Control [*];
}

package DHSODP {
	public import OSCALCatalog::*;
	public import ControlBaseline::*;

	part def Control:> ControlBaseline::Control {
		attribute sortId : ID;
		attribute family : Name;
//		attribute controlId : ID;
//		attribute controlName : Name;
//		attribute controlDescription : Text;
		part odps : Parameter [*];
	}

	part def ControlHigh :> Control {
		//attribute parameters : Text;
		attribute values : Text;
	}
	part baselineLows : Control [*];
	part baselineMod : Control [*];
	part baselineHigh : ControlHigh [*];
}

//dependency from DHSODP to ControlBaseline;
//dependency from ControlBaseline to OSCALCatalog;
