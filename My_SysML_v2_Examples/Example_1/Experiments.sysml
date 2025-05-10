package Experiments {
	
	part def Element {
		
	}
	part def Feature:> Element {
		
	}
	
	part def Typing {
		
	}
	
	part def Ownership {
		
	}
	part def Structure:> Element {
		
	}
	
	part def PartFeature:> Feature, Structure {
		
	}
	part def Engine {
	}
	
	part def Wheel {
		
	}
	
	part def Battery{
		
	}
	part def Car {
		part engine: Engine;
		part wheels[4]: Wheel;
	}
	
	part def ElectricCar:> Car {
		part battery: Battery;		
	}
	
	part def Relationship:> Element {
		
	}
	

}
package DependencyExamples{
	public import Experiments::*;
	
	package ApplicationLayer{
		part Part1: Experiments::Element;
		part Part2: Experiments::Element;
	}
	package ServiceLayer{}
	package DataLayer{}
	package ExternalInterfaceLayer{}	
	dependency Use
      from 'ApplicationLayer' to 'ServiceLayer';

    // 'Service Layer' is the client of this dependency, not its name.
    dependency 'ServiceLayer'
      to 'DataLayer', 'ExternalInterfaceLayer' {
      /* 'Service Layer' is the client of this dependency,
       * not its name. */
    }
}
package CommonDefinitions{
	attribute def ID:> ScalarValues::String;    	
	attribute def Label:> ScalarValues::String;
	attribute def Namespace:> ScalarValues::String;
	attribute def Version:> ScalarValues::String;
	attribute def Name:> ScalarValues::String;
	attribute def Value:> ScalarValues::String;
	attribute def Propose:> ScalarValues::String;
	attribute def Text:> ScalarValues::String;
	attribute def Prose:> ScalarValues::String;
	attribute def HowMany:> ScalarValues::String;
	attribute def Choice:> ScalarValues::String;
	attribute def HRef:> ScalarValues::String;
	attribute def Citation:> ScalarValues::String;
	attribute def UUID:> ScalarValues::String;
	attribute def EmailAddress:> ScalarValues::String;
	
    attribute def Guideline { 
		attribute proses: Prose[*];
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
		attribute href: HRef;
		attribute relate: Relate;
	}
	
	attribute def Revision{
		attribute title: ScalarValues::String;
		attribute lastModified: ScalarValues::String;
		attribute version: Version;
		attribute oscalVersion:ScalarValues::String;
		attribute links: Link[*];
		attribute remarks: Text[*];
	}
	
	attribute def Property {
		attribute name: Name;
		attribute value: Value;
		attribute class: Class;
		attribute ns: Namespace;
	}
	
	attribute def Role{
		attribute id: ID;
		attribute title: ScalarValues::String;
	}
		
	
	attribute def Address {
		attribute addressLines: ScalarValues::String[*];
		attribute city: ScalarValues::String;
		attribute _state: ScalarValues::String;
		attribute postalCode: ScalarValues::String;
	}
			
	part def Party {
		attribute uuid: UUID;
		attribute type: ScalarValues::String;
		attribute emailAddresses[*]: EmailAddress;
		attribute addresses: Address[*];			
	}
		
	part def ResponsibleParty{
		attribute roleID: RoleID;
		attribute partyUUIDs[*]: UUID;
	}
	
	part def Resource {
		attribute uuid: UUID;
		attribute title: ScalarValues::String;
		attribute citation: Citation;
		attribute rlinks[*]: Link;
	}
}
	
package <'SP800_53Rev5'> Catalog {
	public import ScalarValues;
	public import CommonDefinitions::*;
	public import ISQSpaceTime::*;
	

	package PartDefinitions{}
	
	part Metadata {
		attribute title: Text;
		attribute lastModified: TimeValue;
		attribute version: Version;
		attribute oscalVersion: Version;
		attribute revisions[*]: Revision;
		attribute properties[*]: Property;
		attribute links[*]: Link;
		attribute roles[*]: Role;
		part parties[*]: Party;
		part responsibleParties[*]: ResponsibleParty;
	}
	part BackMatter{
		part resources[*]: Resource;
	}
	part def <'Safeguard'> Control {
		attribute familyID: ID;
		attribute <'control_id'> id : ID;
		attribute <'control_name'> title: ScalarValues::String;
		attribute _class: Class;
		attribute baseControl: ScalarValues::String[*];
		attribute discussion: ScalarValues::String[*];
		attribute parameterIDs[*]: ID;
		attribute subcontrolIDs[*]: ID;
		attribute properties[*]: Property;
		attribute links[*]: Link;
		attribute partIDs[*]: ID;
		part parts[*]: Part;
	}
	
	part def <'Family'> Group {
		attribute <'family_id'> id: ID;
		attribute _class: Class;
		attribute <'family_name'> title: Text;
		part <'safeguards'> controls[*]: Control;
	}
	
	part <'families'> groups[*]: Group;
		
		part def Part{
			attribute id: ID;
			attribute name: Name;
			attribute prose: Prose;
			attribute properties: Property[*];
			attribute links: Link[*];
			attribute partIds: ID[*];
			part parts: Part[*];
		}
	
	
}
