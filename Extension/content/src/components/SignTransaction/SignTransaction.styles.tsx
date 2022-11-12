import styled from "@emotion/styled";

export const SignTransactionDescriptionContainer = styled.div`
  padding: 10px 18px 10px 12px;
  word-break: break-all;
  font-size: 18px;
  font-weight: 700;
  line-height: 1.6rem;
  color: #544949;
`;

export const SignTransactionGasContainer = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

export const SignTransactionGasSelectContainer = styled.div`
  position: relative;
  display: flex;
  justify-content: space-between;
  align-items: center;
  z-index: 2147483647;

  -webkit-appearance: listbox !important;
`;

export const SignTransactionGasSelect = styled.select`
  background-color: #e0e0e0;
  color: gray;
  height: 2rem;
  padding-top: 0.25rem;
  padding-bottom: 0.25rem;
  font-size: 1.25rem;
  margin-left: 1rem;
  border-style: none;
  text-align-last: right;

  option {
    direction: rtl;
    color: black;
    display: flex;
    white-space: pre;
  }
`;
