import { create } from "zustand";
import { persist } from "zustand/middleware";

interface StepState {
  step: number;
  setStep: (newStep: number) => void;
}

export const useUserStep = create(
  persist<StepState>(
    set => {
      return {
        step: 0,
        setStep: newStep => {
          return set(() => {
            return { step: newStep };
          });
        },
      };
    },
    {
      name: "@lightwallet/step",
    },
  ),
);
