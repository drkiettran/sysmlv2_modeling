// comment: RFC 2828, definition of a countermeasure or a security control or a safeguard.
// Page 45:
//(I) An action, device, procedure, or technique that reduces a
//    threat, a vulnerability, or an attack by eliminating or preventing
//    it, by minimizing the harm it can cause, or by discovering and
//    reporting it so that corrective action can be taken.
//(C) In an Internet protocol, a countermeasure may take the form of
//    a protocol feature, an element function, or a usage constraint.


package SP_800_53_Rev5_Model {
    public import Definitions::*;  
    //public import ISQ::*;
    public import ScalarValues;
    package Definitions{
    	attribute def ID:> ScalarValues::String;    	
    	attribute def Label:> ScalarValues::String;
    	attribute def Namespace:> ScalarValues::String;
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
    	
		attribute def Property {
			attribute name: Name;
			attribute value: Value;
			attribute class: Class;
			attribute ns: Namespace;
		}
		
		attribute def Select {
			attribute howMany: HowMany;
			attribute choices: Choice[*];
		}
		
		attribute def Role{
			attribute id: ID;
			attribute title: ScalarValues::String;
		}
		
		part def Parameter {
			attribute paramId: ID;
			attribute label: Label;
			attribute properties[*]: Property;
			attribute guidelines[*]: Guideline;
			attribute select: Select;
		}
		
		attribute def Link {
			attribute href: HRef;
			attribute relate: Relate;
		}
		
		attribute def Address {
			attribute addressLines: ScalarValues::String[*];
			attribute city: ScalarValues::String;
			attribute _state: ScalarValues::String;
			attribute postalCode: ScalarValues::String;
		}
		
		attribute def Revision{
			attribute title: ScalarValues::String;
			attribute lastModified: ScalarValues::String;
			attribute version: ScalarValues::String;
			attribute oscalVersion:ScalarValues::String;
			attribute links: Link[*];
			attribute remarks: Text[*];
		}
		
		part def Resource {
			attribute uuid: UUID;
			attribute title: ScalarValues::String;
			attribute citation: Citation;
			attribute rlinks: Link[*];
		}
		
		part def Family{
			attribute id: ID;
			attribute title: ScalarValues::String;
			attribute class: Class;
			attribute controlIDs: ID[*];
		}
		
		part def BackMatter{
			part resources: Resource[*];
		}
		
		part def Metadata{
			attribute title: ScalarValues::String;
			attribute lastModified: ScalarValues::String;
			attribute version: ScalarValues::String;
			attribute oscalVersion: ScalarValues::String;
			attribute revisions: Revision[*];
			attribute properties: Property[*];
			attribute links: Link[*];
			attribute roles: Role[*];
			part parties: Party[*];
			part responsibleParties: ResponsibleParty[*];
		}
		part def Party {
			attribute uuid: UUID;
			attribute type: ScalarValues::String;
			attribute emailAddresses: ScalarValues::String[*];
			attribute addresses: Address[*];			
		}
		
		part def ResponsibleParty{
			attribute roleID: RoleID;
			attribute partyUUIDs: UUID[*];
		}
		

		part def Part{
			attribute id: ID;
			attribute name: Name;
			attribute prose: Prose;
			attribute properties: Property[*];
			attribute links: Link[*];
			attribute partIds: ID[*];
			part parts: Part[*];
		}
		
		part def Control {
			attribute familyID: ID;
			attribute id : ID;
			attribute title: ScalarValues::String;
			attribute class: Class;
			attribute baseControl: ScalarValues::String[*];
			attribute discussion: ScalarValues::String[*];
			attribute parameterIDs: ID[*];
			attribute subcontrolIDs: ID[*];
			attribute properties: Property[*];
			attribute links: Link[*];
			attribute partIDs: ID[*];
			part parts: Part[*];
		}

		part def Catalog{
			attribute uuid: UUID;
			attribute filename: ScalarValues::String;
			attribute rawData: Text[*];
			part _metadata: Metadata;
			part families: Family[*];
			part controls: Control[*];
			part backMatter: BackMatter;
			part subcontrols: Control[*];
			part parameters: Parameter[*];
			part parts: Part[*];
		}
		
//  	part def Group {
//			attribute id: ScalarValues::String;
//			attribute class: Class;
//			attribute title: ScalarValues::String;
//			part controls: Control[*];
//		}

    	part def SP800_53A {
    		part catalog: Catalog;
    	}
    	
		
//		attribute def OrganizationDefinedParameter {
//		}
    }
}
