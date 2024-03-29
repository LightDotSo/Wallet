import { mountStoreDevtool } from "simple-zustand-devtools";
import { create } from "zustand";

interface TransactionTotalValueState {
  totalValue: number;
  setTotalValue: (by: number) => void;
}

export const useTransactionTotalValue = create<TransactionTotalValueState>(
  set => {
    return {
      totalValue: 0,
      setTotalValue: value => {
        return set(() => {
          return { totalValue: value };
        });
      },
    };
  },
);

if (process.env.NODE_ENV === "development") {
  mountStoreDevtool("useTransactionTotalValue", useTransactionTotalValue);
}
