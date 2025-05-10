package TeachingCUDA {
	public import ScalarValues;
	public import ISQSpaceTime::*;
	
	part HeterogeneousParallelComputingWithCUDA {
		part ParalellComputing {
			
		}
		part HeterogeneousComputing {
			
		}
		part AnExample {
			
		}
		
	}
	
	part CUDAProgrammingModel {
		part ProgrammingStructure {
			
		}
		part ManagingMemory{
			
		}
		part LaunchingACUDAKernel {
			
		}
		part WritingKernel {
			
		}
		part VerifyingKernel {
			
		}
		part HandlingErrors{
			
		}
		part CompilingAndExecuting {
			
		}
	}
	
	part CUDAExecutionModel {
		part Introduction {
			
		}
		part NatureOfWarpExecution{
			
		}
		part Parallelism {
			
		}
		part BranchDivergence {
			
		}
		part UnrollingLoops {
			
		}
		part DynamicParallelism {
			
		}
	}
	
	part GlobalMemory {
		part CUDAMemoryModel {
			
		}
		part MemoryManagement {
			
		}
		part MemoryAccessPatterns {
			
		}
		part Bandwidth {
			
		}
		part UnifiedMemory {
			
		}
	}
	
	part SharedMemoryAndConstantMemory{
		part CUDASharedMemoryModel {
			
		}
		part DataLayoutOfSharedMemory{
			
		}
		
		part ReducingGloalMemoryAccess{
			
		} 
		
		part CoalescingGlobalMemoryAccess{
			
		}
		
		part ConstantMemory{
			
		}
		
		part WarpShuffleInstructionP{
			
		}
	}
	
	
	part TuningInstructionLevelPrimitive{
		
	}
	
	dependency from CUDAProgrammingModel to HeterogeneousParallelComputingWithCUDA;
	dependency from CUDAExecutionModel to CUDAProgrammingModel;
	dependency from GlobalMemory to CUDAExecutionModel;
	dependency from SharedMemoryAndConstantMemory to CUDAExecutionModel;
}


package TeachingCUDAProgramming {
	
	public import CUDAProgramming::HeterogeneousParallelComputingWithCUDA::*;
	
	action def SequentialAlgorithmDesign {
		action understandTheProblem;
		action analyzeTheRequirements;
		action chooseAStrategy;
		action breakDownTheProblem;
		action createFlowchartsOrPseudo;
		action reviewAndRefine;
	}
	action def ParallelAlgorithmDesign{
		action partitioning;
		action communication;				
		action aggregate;
		action mapping;
	}
	enum def Parallelism {
		enum taskParallelism;
		enum dataParallelism;
	}
	enum def ComputerArchitecture {
		enum SIMD;
		enum SISD;
		enum MIMD;
		enum MISD;
		enum SIMT;
	}
	part chapterOne {
		part parallelComputing: ParalellComputing{
			part sequentialProgramming {
				action defineTheProblem;
				action designSequentialAlgorithm: SequentialAlgorithmDesign;
				action writeCode;
				action buildProgram;
				action testProgram;
			}
			part parallelProgramming {
				enum parallelism: Parallelism;
				action defineTheProblem;
				action designParallelAlgorithm: ParallelAlgorithmDesign;
				action writeCode;
				action buildProgram;
				action testProgram;				
			}
		}

		part heterogeneousComputing: HeterogeneousComputing{
			part heterogeneousArchitecture {
				enum def GPUPlatform{
					enum Tegra;
					enum GeForce;
					enum Quadro;
					enum Tesla;
				}
			
				attribute def GPUCapability{
					attribute numberOfCourse: ScalarValues::Integer;
					attribute memorySize: ScalarValues::Integer;
				}
				
				attribute def GPUPerformance{
					attribute peakComputationalPerformance: ScalarValues::Integer;
					attribute memoryBandWidth: ScalarValues::Integer;
				}
				
				enum platform: GPUPlatform;
				attribute capability: GPUCapability;
				attribute performance: GPUPerformance;
				attribute computeCapability: ScalarValues::String;
				part hostCode;
				part deviceCode;
			}
			
			part heterogeneousComputingParadigm {
				
			}
			part cudaPlatform {
				
			}
		}
		
		part anExamples {
			part helloWorldExample: AnExample {
				
			}
			part arraySumExample: AnExample {
				
			}
		}
	}
}