cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  pulmonary-circulation-disorders-elixhauser-primary-care-embolism---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-embolism---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  pulmonary-circulation-disorders-elixhauser-primary-care-heart---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-heart---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-embolism---primary/output
  pulmonary-circulation-disorders-elixhauser-primary-care-hypertension---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-hypertension---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-heart---primary/output
  pulmonary-circulation-disorders-elixhauser-primary-care-fluid---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-fluid---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-hypertension---primary/output
  obstetric-pulmonary-circulation-disorders-elixhauser-primary-care---primary:
    run: obstetric-pulmonary-circulation-disorders-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-fluid---primary/output
  pulmonary-circulation-disorders-elixhauser-primary-care-delivered---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-delivered---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: obstetric-pulmonary-circulation-disorders-elixhauser-primary-care---primary/output
  acute-pulmonary-circulation-disorders-elixhauser-primary-care---primary:
    run: acute-pulmonary-circulation-disorders-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-delivered---primary/output
  pulmonary-circulation-disorders-elixhauser-primary-care-pulmonale---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-pulmonale---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: acute-pulmonary-circulation-disorders-elixhauser-primary-care---primary/output
  pulmonary-circulation-disorders-elixhauser-primary-care-vessel---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-vessel---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-pulmonale---primary/output
  pulmonary-circulation-disorders-elixhauser-primary-care---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-vessel---primary/output
  other-pulmonary-circulation-disorders-elixhauser-primary-care---primary:
    run: other-pulmonary-circulation-disorders-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care---primary/output
  chronic-pulmonary-circulation-disorders-elixhauser-primary-care---primary:
    run: chronic-pulmonary-circulation-disorders-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: other-pulmonary-circulation-disorders-elixhauser-primary-care---primary/output
  pulmonary-circulation-disorders-elixhauser-primary-care-specified---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: chronic-pulmonary-circulation-disorders-elixhauser-primary-care---primary/output
  pulmonary-circulation-disorders-elixhauser-primary-care-congestion---primary:
    run: pulmonary-circulation-disorders-elixhauser-primary-care-congestion---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-specified---primary/output
  circulation---primary:
    run: circulation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: pulmonary-circulation-disorders-elixhauser-primary-care-congestion---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: circulation---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
